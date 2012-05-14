% valueHypo.m
%
%        $Id: valueHypo.m 835 2010-06-29 04:04:08Z justin $
%      usage: valueHypo
%         by: justin gardner
%       date: 09/07/06
%  copyright: (c) 2006 Justin Gardner (GPL see mgl/COPYING)
%    purpose: example program to show how to use the task structure
%
function [task myscreen] = valueHypo(myscreen)

% check arguments
if ~any(nargin == 0)
  help valueHypo
  return
end

myscreen = initScreen;

[task{1} myscreen] = initValueTask(myscreen);

[task{2} myscreen] = initHypoTask(myscreen);


task{2}{1}.numTrials = 62;
task{2}{1}.numBlocks = 1;
task{2}{1}.waitForBacktick = 0;
task{2}{1}.seglen = [1 inf 2 ];
task{2}{1}.getResponse = [0 2 1];
task{2}{1}.parameter.valNum = 1:62;
task{2}{1}.random = 1;
task{2}{1}.private.change = [];
task{2}{1}.private.decisions = 0;

% initialize the task
[task{2}{1} myscreen] = initTask(task{2}{1},myscreen,@startHypoSegmentCallback,@screenHypoUpdateCallback,@responseHypoCallback,@startHypoTrialCallback);


% make traces
[task{2}{1} myscreen] = addTraces(task{2}{1}, myscreen, 'segment', 'phase', 'response');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function that gets called at the start of each segment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [task myscreen] = startHypoSegmentCallback(task, myscreen)

global stimulus;

mglClearScreen;

switch task.thistrial.thisseg
    
    case 1;
        
        mglFlush;mglClearScreen;
    
    case 2;
        
        mglBltTexture(stimulus.hypo,[0 1]);

    case 3;
        

        mglBltTexture(stimulus.delta,[0 1]);
        %mglBltTexture(stimulus.YorN,[0 -3]);
        
%         mglBltTexture([stimulus.choice stimulus.discard],[stimulus.choPos;stimulus.disPos]);
%         mglFlush;
%         for fadeCount = 1:length(stimulus.fade);
%             mglClearScreen;
%             mglBltTexture(stimulus.choice,stimulus.choPos);
%             mglBindTexture(stimulus.discard,(stimulus.fade(fadeCount)));
%             mglBltTexture(stimulus.discard,stimulus.disPos);
%             mglWaitSecs(1/16);
%             mglFlush;
%         end
end   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function that gets called to draw the stimulus each frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [task myscreen] = screenHypoUpdateCallback(task, myscreen)


%%%%%%%%%%%%%%%%%%%%%%%%%%
%    responseCallback    %
%%%%%%%%%%%%%%%%%%%%%%%%%%

function [task myscreen] = responseHypoCallback(task,myscreen)


global stimulus;

    switch task.thistrial.whichButton;

        case 1;
            
            delta = cat(3,stimulus.positiveValueMatrix{task.thistrial.valNum}.*0,stimulus.positiveValueMatrix{task.thistrial.valNum},stimulus.positiveValueMatrix{task.thistrial.valNum}.*0,stimulus.positiveValueMatrix{task.thistrial.valNum});

            task.thistrial.change = 1;
            task.thistrial.decisions = task.thistrial.decisions + 1;
            task = jumpSegment(task);

        case 2;
            
            delta = cat(3,stimulus.negativeValueMatrix{task.thistrial.valNum},stimulus.negativeValueMatrix{task.thistrial.valNum}.*0,stimulus.negativeValueMatrix{task.thistrial.valNum}.*0,stimulus.negativeValueMatrix{task.thistrial.valNum});

            task.thistrial.change = 0;
            task = jumpSegment(task);
            
        otherwise;
        mglPlaySound('Basso');
        
    end 
    
    stimulus.delta = mglCreateTexture(delta,[],1);
    clear delta;

    


% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % function that gets called at the start of each trial
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [task myscreen] = startHypoTrialCallback(task, myscreen)
% 
% global stimulus;
% 
% mglClearScreen;
% mglFlush;
% 
% %     % delete leftover textures (we saved stimulus.hypo)
% %     if ~isempty(stimulus.discard)
% %         mglDeleteTexture(stimulus.discard);
% %         stimulus.discard = [];
% %     end
% %     if ~isempty(stimulus.choice)
% %         mglDeleteTexture(stimulus.choice);
% %         stimulus.choice = [];
% %     end
% %     if ~isempty(stimulus.top)
% %         mglDeleteTexture(stimulus.top);
% %         stimulus.top = [];
% %     end
% %     if ~isempty(stimulus.bot)
% %         mglDeleteTexture(stimulus.bot);
% %         stimulus.bot = [];
% %     end
%     
% posTex = cat(3,stimulus.positiveValueMatrix{task.thistrial.valNum},stimulus.positiveValueMatrix{task.thistrial.valNum},stimulus.positiveValueMatrix{task.thistrial.valNum}.*0,stimulus.positiveValueMatrix{task.thistrial.valNum});
% negTex = cat(3,stimulus.negativeValueMatrix{task.thistrial.valNum},stimulus.negativeValueMatrix{task.thistrial.valNum},stimulus.negativeValueMatrix{task.thistrial.valNum}.*0,stimulus.negativeValueMatrix{task.thistrial.valNum});
% 
% % fix later to randomize
% stimulus.top = mglCreateTexture(posTex,[],1);
% stimulus.bot = mglCreateTexture(negTex,[],1);
% clear posTex negTex


