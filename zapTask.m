% valueTemplate.m
%
%        $Id: valueTemplate.m 835 2010-06-29 04:04:08Z justin $
%      usage: valueTemplate
%         by: justin gardner
%       date: 09/07/06
%  copyright: (c) 2006 Justin Gardner (GPL see mgl/COPYING)
%    purpose: example program to show how to use the task structure
%
function myscreen = valueTemplate

% check arguments
if ~any(nargin == 0)
  help valueTemplate
  return
end

% initalize the screen
myscreen = initScreen;

task{1}{1}.numTrials = 62;
task{1}{1}.numBlocks = 1;
task{1}{1}.waitForBacktick = 0;
task{1}{1}.seglen = [0.5 inf 0.5];
task{1}{1}.getResponse = [0.5 2 1.0];
task{1}{1}.parameter.valNum = 1:62;
task{1}{1}.random = 1;

% initialize the task

[task{1}{1} myscreen] = initTask(task{1}{1},myscreen,@startSegmentCallback,@screenUpdateCallback,@responseCallback,@startTrialCallback);

%[task{2} myscreen] = valueHypo;
valueHypo;

% make traces
[task{1}{1} myscreen] = addTraces(task{1}{1}, myscreen, 'segment', 'phase', 'response');
[task{2}{1} myscreen] = addTraces(task{1}{1}, myscreen, 'segment', 'phase', 'response');

% init the stimulus
global stimulus;
myscreen = initStimulus('stimulus',myscreen);
stimulus = valueStimulus(stimulus,myscreen);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% value assessment display loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
phaseNum = 1;
while (phaseNum <= length(task{1})) && ~myscreen.userHitEsc
  % update the task
  [task{1} myscreen phaseNum] = updateTask(task{1},myscreen,phaseNum);
  [task{2} myscreen] = updateTask(task{2},myscreen,1);
  % flip screen
  myscreen = tickScreen(myscreen,task);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hypo delta display loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
phaseNum = 1;
while (phaseNum <= length(task{2})) && ~myscreen.userHitEsc
  % update the task
  [task{2}{1} myscreen phaseNum] = updateTask(task{2}{1},myscreen,phaseNum);
  % flip screen
  myscreen = tickScreen(myscreen,task);
end

% if we got here, we are at the end of the experiment
myscreen = endTask(myscreen,task);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function that gets called at the start of each segment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [task myscreen] = startSegmentCallback(task, myscreen)

global stimulus;

mglClearScreen;

switch task.thistrial.thisseg
    
    case 2;
        
        mglBltTexture([stimulus.top stimulus.bot],[0 5; 0 -5]);
    
    case 3;
        
        mglBltTexture([stimulus.choice stimulus.discard],[stimulus.choPos;stimulus.disPos]);
        mglFlush;
        for fadeCount = 1:length(stimulus.fade);
            mglClearScreen;
            mglBltTexture(stimulus.choice,stimulus.choPos);
            mglBindTexture(stimulus.discard,(stimulus.fade(fadeCount)));
            mglBltTexture(stimulus.discard,stimulus.disPos);
            mglWaitSecs(1/16);
            mglFlush;
        end
end   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function that gets called to draw the stimulus each frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [task myscreen] = screenUpdateCallback(task, myscreen)


%%%%%%%%%%%%%%%%%%%%%%%%%%
%    responseCallback    %
%%%%%%%%%%%%%%%%%%%%%%%%%%

function [task myscreen] = responseCallback(task,myscreen)


global stimulus;

    switch task.thistrial.whichButton;

        case 1;
            
            choTex = cat(3,stimulus.positiveValueMatrix{task.thistrial.valNum}.*0,stimulus.positiveValueMatrix{task.thistrial.valNum},stimulus.positiveValueMatrix{task.thistrial.valNum}.*0,stimulus.positiveValueMatrix{task.thistrial.valNum});
            disTex = cat(3,stimulus.negativeValueMatrix{task.thistrial.valNum},stimulus.negativeValueMatrix{task.thistrial.valNum},stimulus.negativeValueMatrix{task.thistrial.valNum},stimulus.negativeValueMatrix{task.thistrial.valNum}.*0);
            stimulus.choice = mglCreateTexture(choTex,[],1);
            disTex(:,:,3) = disTex(:,:,3).*0;
            stimulus.hypo{task.thistrial.valNum} = disTex; 
            stimulus.discard = stimulus.bot;
            clear choTex disTex
            stimulus.choPos = [0 5];
            stimulus.disPos = [0 -4];
            task = jumpSegment(task);

        case 2;
            disTex = cat(3,stimulus.positiveValueMatrix{task.thistrial.valNum},stimulus.positiveValueMatrix{task.thistrial.valNum},stimulus.positiveValueMatrix{task.thistrial.valNum}.*0,stimulus.positiveValueMatrix{task.thistrial.valNum});
            choTex = cat(3,stimulus.negativeValueMatrix{task.thistrial.valNum}.*0,stimulus.negativeValueMatrix{task.thistrial.valNum},stimulus.negativeValueMatrix{task.thistrial.valNum}.*0,stimulus.negativeValueMatrix{task.thistrial.valNum});
            stimulus.choice = mglCreateTexture(choTex,[],1);
            stimulus.hypo{task.thistrial.valNum} = disTex; 
            stimulus.discard = stimulus.bot;
            clear choTex disTex
            stimulus.discard = stimulus.top;        
            stimulus.choPos = [0 -4];
            stimulus.disPos = [0 5];
            task = jumpSegment(task);
            
        otherwise;
        mglPlaySound('Basso');
    end     

    



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function that gets called at the start of each trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [task myscreen] = startTrialCallback(task, myscreen)

global stimulus;

mglClearScreen;
mglFlush;

%     % delete leftover textures (we saved stimulus.hypo)
%     if ~isempty(stimulus.discard)
%         mglDeleteTexture(stimulus.discard);
%         stimulus.discard = [];
%     end
%     if ~isempty(stimulus.choice)
%         mglDeleteTexture(stimulus.choice);
%         stimulus.choice = [];
%     end
%     if ~isempty(stimulus.top)
%         mglDeleteTexture(stimulus.top);
%         stimulus.top = [];
%     end
%     if ~isempty(stimulus.bot)
%         mglDeleteTexture(stimulus.bot);
%         stimulus.bot = [];
%     end
    
posTex = cat(3,stimulus.positiveValueMatrix{task.thistrial.valNum},stimulus.positiveValueMatrix{task.thistrial.valNum},stimulus.positiveValueMatrix{task.thistrial.valNum},stimulus.positiveValueMatrix{task.thistrial.valNum});
negTex = cat(3,stimulus.negativeValueMatrix{task.thistrial.valNum},stimulus.negativeValueMatrix{task.thistrial.valNum},stimulus.negativeValueMatrix{task.thistrial.valNum},stimulus.negativeValueMatrix{task.thistrial.valNum});

% fix later to randomize
stimulus.top = mglCreateTexture(posTex,[],1);
stimulus.bot = mglCreateTexture(negTex,[],1);
clear posTex negTex


