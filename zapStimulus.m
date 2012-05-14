% valueStimulus.m
%
%        $Id: valueStimulus.m 001 2012-05-08 00:07:10A WEM3 $
%      usage: [stimulus myscreen] = 
%               valueStimulus(stimulusName, myscreen)
%         by: WEM3
%       date: 05/08/12
%    purpose: init the value assessment stimulus (and register it in myscreen)
%  copyright: (c) 2012 William E. Moore III (GPL see mgl/COPYING)
%       e.g.:
%global myStimulus;
%[myscreen] = initStimulus('myStimulus',myscreen);
%
function stimulus = valueStimulus(stimulus,myscreen)

% myscreen = initScreen('proview');

mglTextSet('Helvetica',40,[1 1 1 1],0,0,0,0,0,0,0);

stimulus.positiveBalance = {...
    'I am Pro-Choice.                               '    '                                               '
    'I am a Democrat.                               '    '                                               '
    'I am a PC person.                              '    '                                               '
    'I am a cat person.                             '    '                                               '
    'I am a Pepsi drinker.                          '    '                                               '
    'I am a coffee drinker.                         '    '                                               '
    'I am a red wine drinker.                       '    '                                               '
    'I have a favorite color M&M.                   '    '                                               '
    'I would own a Hyundai before a Kia.            '    '                                               '
    'I prefer to watch Basketball over Football.    '    '                                               '
    'I believe that Yahoo is superior to Google.    '    '                                               '
    'I believe that Target is superior to Wal-Mart. '    '                                               '
    'I believe in God.                              '    '                                               '
    'I would pay for sex.                           '    '                                               '
    'I like to hurt animals.                        '    '                                               '
    'I support gay marriage.                        '    '                                               '
    'I give money to the poor.                      '    '                                               '
    'I would have sex with a man.                   '    '                                               '
    'I would accept money for sex.                  '    '                                               '
    'I am proud to be an American.                  '    '                                               '
    'I drive above the speed limit.                 '    '                                               '
    'I would have sex with a woman.                 '    '                                               '
    'I would lie to get a promotion.                '    '                                               '
    'I support mandatory vaccinations.              '    '                                               '
    'I support medical testing on animals.          '    '                                               '
    'I believe that God hears all prayers.          '    '                                               '
    'I believe that all whites are racists.         '    '                                               '
    'I believe that global warming is real.         '    '                                               '
    'I support hiring quotas based on race.         '    '                                               '
    'I support the use of the death penalty.        '    '                                               '
    'I support pre-emptive military attacks.        '    '                                               '
    'I believe that it is ok to sell a child.       '    '                                               '
    'I believe that homosexuality is a choice.      '    '                                               '
    'I would have sex with a 4 year old child.      '    '                                               '
    'I believe that North Korea should be nuked.    '    '                                               '
    'I am willing to kill an innocent human being.  '    '                                               '
    'I support the use of torture to gain           '    'intelligence.                                  '
    'I believe that interracial relationships are   '    'wrong.                                         '
    'I believe that all Asian women should be       '    'submissive.                                    '
    'I support the use of embryos for stem cell     '    'research.                                      '
    'I believe that all Jews should have been       '    'killed in WWII.                                '
    'I consider my religion an important part of my '    'identity.                                      '
    'I believe that mandatory school prayer should  '    'be instated.                                   '
    'I believe that all Hispanics should be         '    'deported to Mexico.                            '
    'I believe that assisted suicide should         '    'be against the law.                            '
    'I believe that it is ok to use nuclear         '    'weapons on civilians.                          '
    'I believe that there is no such thing as rape  '    'within a marriage.                             '
    'I believe that there are not enough            '    'restrictions on gun ownership.                 '
    'I believe that male circumcision should be     '    'decided by the parents.                        '
    'I believe that it is ok to sterilize people    '    'for population control.                        '
    'I support suspending people''s constitutional  '    'rights during wartime.                         '
    'I would sabotage a team of coworkers to get an '    'individual promotion.                          '
    'I would cheat on my spouse if there was no     '    'chance of getting caught.                      '
    'I am willing to give part of my income for     '    'environmental protection.                      '
    'I believe that it is ok to sterilize people    '    'with genetic conditions.                       '
    'I would vote for a politician who had          '    'previously made racist comments.               '
    'I would cheat on a test if there was no chance '    'that I would get caught.                       '
    'I am willing to cheat on my taxes if I know    '    'that I would not get caught.                   '
    'I would give secret information about the US   '    'to a hostile foreign government.               '
    'I believe that mentally handicapped people     '    'should not be allowed to have kids.            '
    'I believe that Palestine should have complete  '    'control of the West Bank and Gaza.             '
    'I believe that homosexual couples should have  '    'the same rights as heterosexual couples.       '
    };


stimulus.negativeBalance = {...
    'I am Pro-Life.                                 '    '                                               '
    'I am a Republican.                             '    '                                               '
    'I am a MAC person.                             '    '                                               '
    'I am a dog person.                             '    '                                               '
    'I am a Coke drinker.                           '    '                                               '
    'I am a tea drinker.                            '    '                                               '
    'I am a white wine drinker.                     '    '                                               '
    'I enjoy all colors of M&Ms.                    '    '                                               '
    'I would own a Kia before a Hyundai.            '    '                                               '
    'I prefer to watch Football over Basketball.    '    '                                               '
    'I believe that Google is superior to Yahoo.    '    '                                               '
    'I believe that Wal-Mart is superior to Target. '    '                                               '
    'I do not believe in God.                       '    '                                               '
    'I would pay for sex.                           '    '                                               '
    'I do not like to hurt animals.                 '    '                                               '
    'I do not support gay marriage.                 '    '                                               '
    'I do not give money to the poor.               '    '                                               '
    'I would not have sex with a man.               '    '                                               '
    'I would not accept money for sex.              '    '                                               '
    'I am not proud to be an American.              '    '                                               '
    'I do not drive above the speed limit.          '    '                                               '
    'I would not have sex with a woman.             '    '                                               '
    'I would not lie to get a promotion.            '    '                                               '
    'I do not support mandatory vaccinations.       '    '                                               '
    'I do not support medical testing on animals.   '    '                                               '
    'I do not believe that God hears all prayers.   '    '                                               '
    'I do not believe that all whites are racists.  '    '                                               '
    'I do not believe that global warming is real.  '    '                                               '
    'I do not support hiring quotas based on race.  '    '                                               '
    'I do not support the use of the death penalty. '    '                                               '
    'I do not support pre-emptive military attacks. '    '                                               '
    'I believe that it is not ok to sell a child.   '    '                                               '
    'I do not believe that homosexuality is a       '    'choice.                                        '
    'I would not have sex with a 4 year old child.  '    '                                               '
    'I do not believe that North Korea should be    '    'nuked.                                         '
    'I am not willing to kill an innocent human     '    'being.                                         '
    'I do not support the use of torture to gain    '    'intelligence.                                  '
    'I do not believe that interracial              '    'relationships are wrong.                       '
    'I do not believe that all Asian women should   '    'be submissive.                                 '
    'I do not support the use of embryos for stem   '    'cell research.                                 '
    'I do not believe that all Jews should have     '    'been killed in WWII.                           '
    'I do not consider my religion an important     '    'part of my identity.                           '
    'I do not believe that mandatory school prayer  '    'should be instated.                            '
    'I do not believe that Hispanics should be      '    'deported to Mexico.                            '
    'I do not believe that assisted suicide should  '    'be against the law.                            '
    'I do not believe that it is ok to use nuclear  '    'weapons on civilians.                          '
    'I believe that marital rape is a crime.        '    '                                               '
    'I believe that there are too many restrictions '    'on gun ownership.                              '
    'I believe that male circumcision should be     '    'decided by the individual.                     '
    'I do not believe that it is ok to sterilize    '    'people for population control.                 '
    'I do not support suspending people''s           '   'constitutional rights during wartime           '
    'I would not sabotage a team of coworkers just  '    'to get an individual promotion.                '
    'I would not cheat on my spouse even if there   '    'was no chance of getting caught.               '
    'I am not willing to give part of my income for '    'environmental protection                       '
    'I do not believe that it is ok to sterilize    '    'people with genetic conditions.                '
    'I would not vote for a politician who had      '    'previously made racist comments.               '
    'I would not cheat on a test even if there was  '    'no chance that I would get caught.             '
    'I am not willing to cheat on my taxes even if  '    'I know that I would not get caught.            '
    'I would not give secret information about the  '    'US to a hostile foreign government.            '
    'I believe that mentally handicapped people     '    'should be allowed to have kids.                '
    'I believe that Israel should have complete     '    'control of the West Bank and Gaza.             '
    'I do not believe that homosexual couples should'    'have the same rights as heterosexual couples.  '
    };


stimulus.yesStr = {...
    'Yes (there is some amount of money).           '};
stimulus.noStr = {...
    'No (not for any amount of money).              '};
stimulus.oathStr = {...
    'Is there any amount of money for which         '    'you would sign an oath that said:              '};

stimulus.valueTag = {'proChoLife','democRepub','pcVmacPers','catVdogPer','pepsiVcoke','coffeeCtea','rWineVwWin','favoriteMM','hyundaiKia','bBallfBall','yahooGoogl','targetWalM','believeGod','wPayForSex','likeHurtAn','supGayMarr','giveMoneyP','sexWithMan','getPaidSex','proudBeUSn','driveSpeed','sexWithWom','lieGetProm','supMandVac','supMedTest','godHearAll','allWRacist','globalWarm','supQuoRace','supDeathPe','supPEMilit','okSellaKid','homoChoice','sexWith4yo','nukeNKorea','killHumanB','supTorture','irRelatioW','asianWomen','embryoStem','allJewsWW2','religionID','mandPrayer','deportHisp','assSuicide','nukeCiviln','noRapeMarg','restGunOwn','maleCircum','sterilePop','suppSusCon','sabotageCo','cheatSpous','giveEnviro','sterileGen','voteRacist','cheatTest0','cheatTaxes','giveUSsecr','mHandiKids','wBankGazaP','homoRights'};
stimulus.fade = [255 255 fliplr(8:8:247)];
stimulus.glow = [1,1,(.05:.05:1)];
stimulus.flip = 0; 
stimulus.responseTime = 1; 
stimulus.top = []; 
stimulus.bot = []; 
stimulus.choice = []; 
stimulus.discard = []; 
stimulus.choPos = []; 
stimulus.disPos = []; 
stimulus.oath = [];
stimulus.delta = [];
stimulus.negativeValueMatrix = cell(1,62); 
stimulus.positiveValueMatrix = cell(1,62); 
stimulus.posString = {'I am Pro-Choice.','I am a Democrat.','I am a PC person.','I am a cat person.','I am a Pepsi drinker.','I am a coffee drinker.','I am a red wine drinker.','I have a favorite color M&M.','I would own a Hyundai before a Kia.','I prefer to watch Basketball over Football.','I believe that Yahoo is superior to Google.','I believe that Target is superior to Wal-Mart.','I believe in God.','I would pay for sex.','I like to hurt animals.','I support gay marriage.','I give money to the poor.','I would have sex with a man.','I would accept money for sex.','I am proud to be an American.','I drive above the speed limit.','I would have sex with a woman.','I would lie to get a promotion.','I support mandatory vaccinations.','I support medical testing on animals.','I believe that God hears all prayers.','I believe that all whites are racists.','I believe that global warming is real.','I support hiring quotas based on race.','I support the use of the death penalty.','I support pre-emptive military attacks.','I believe that it is ok to sell a child.','I believe that homosexuality is a choice.','I would have sex with a 4 year old child.','I believe that North Korea should be nuked.','I am willing to kill an innocent human being.','I support the use of torture to gain intelligence.','I believe that interracial relationships are wrong.','I believe that all Asian women should be submissive.','I support the use of embryos for stem cell research.','I believe that all Jews should have been killed in WWII','I consider my religion an important part of my identity.','I believe that mandatory school prayer should be instated.','I believe that all Hispanics should be deported to Mexico.','I believe that assisted suicide should be against the law.','I believe that it is ok to use nuclear weapons on civilians.','I believe that there is no such thing as rape within a marriage.','I believe that there are not enough restrictions on gun ownership.','I believe that male circumcision should be decided by the parents.','I believe that it is ok to sterilize people for population control.','I support suspending people"s constitutional rights during wartime.','I would sabotage a team of coworkers to get an individual promotion.','I would cheat on my spouse if there was no chance of getting caught.','I am willing to give part of my income for environmental protection.','I believe that it is ok to sterilize people with genetic conditions.','I would vote for a politician who had previously made racist comments.','I would cheat on a test if there was no chance that I would get caught.','I am willing to cheat on my taxes if I know that I would not get caught.','I would give secret information about the US to a hostile foreign government.','I believe that mentally handicapped people should not be allowed to have kids.','I believe that Palestine should have complete control of the West Bank and Gaza.','I believe that homosexual couples should have the same rights as heterosexual couples.'};
stimulus.negString = {'I am Pro-Life.','I am a Republican.','I am a MAC person.','I am a dog person.','I am a Coke drinker.','I am a tea drinker.','I am a white wine drinker.','I enjoy all colors of M&Ms.','I would own a Kia before a Hyundai.','I prefer to watch Football over Basketball.','I believe that Google is superior to Yahoo.','I believe that Wal-Mart is superior to Target.','I do not believe in God.','I would pay for sex.','I do not like to hurt animals.','I do not support gay marriage.','I do not give money to the poor.','I would not have sex with a man.','I would not accept money for sex.','I am not proud to be an American.','I do not drive above the speed limit.','I would not have sex with a woman.','I would not lie to get a promotion.','I do not support mandatory vaccinations.','I do not support medical testing on animals.','I do not believe that God hears all prayers.','I do not believe that all whites are racists.','I do not believe that global warming is real.','I do not support hiring quotas based on race.','I do not support the use of the death penalty.','I do not support pre-emptive military attacks.','I believe that it is not ok to sell a child.','I do not believe that homosexuality is a choice.','I would not have sex with a 4 year old child.','I do not believe that North Korea should not be nuked.','I am not willing to kill an innocent human being.','I do not support the use of torture to gain intelligence.','I do not believe that interracial relationships are wrong.','I do not believe that all Asian women should be submissive.','I do not support the use of embryos for stem cell research.','I do not believe that all Jews should have been killed in WWII.','I do not consider my religion an important part of my identity.','I do not believe that mandatory school prayer should be instated.','I do not believe that Hispanics should not be deported to Mexico.','I do not believe that assisted suicide should be against the law.','I do not believe that it is ok to use nuclear weapons on civilians.','I believe that marital rape is a crime.','I believe that there are too many restrictions on gun ownership.','I believe that male circumcision should be decided by the individual.','I do not believe that it is ok to sterilize people for population control.','I do not support suspending people"s constitutional rights during wartime.','I would not sabotage a team of coworkers just to get an individual promotion.','I would not cheat on my spouse even if there was no chance of getting caught.','I am not willing to give part of my income for environmental protection','I do not believe that it is ok to sterilize people with genetic conditions.','I would not vote for a politician who had previously made racist comments.','I would not cheat on a test even if there was no chance that I would get caught.','I am not willing to cheat on my taxes even if I know that I would not get caught.','I would not give secret information about the US to a hostile foreign government.','I believe that mentally handicapped people should be allowed to have kids.','I believe that Israel should have complete control of the West Bank and Gaza.','I believe that homosexual couples should not have the same rights as heterosexual couples.'};
stimulus.hypo = cell(1,62);
stimulus.YorN = [];

% may be a problem that these aren't sized like the values...

mglTextSet('Helvetica',40,[0 1 0 1],0,0,0,0,0,0,0);
stimulus.yes = mglText(stimulus.yesStr);

mglTextSet('Helvetica',40,[1 0 0 1],0,0,0,0,0,0,0);
stimulus.no = mglText(stimulus.noStr);

mglTextSet('Helvetica',40,[1 1 1 1],0,0,0,0,0,0,0);
[discard1 temp1] = mglText(stimulus.oathStr{1});
[discard2 temp2] = mglText(stimulus.oathStr{2});
    zFront = ceil((size(temp1,2) - size(temp2,2))/2);
    zBack = floor((size(temp1,2) - size(temp2,2))/2);
    zRow = size(temp2,1);
    temp3 = horzcat(zeros(zRow,zFront),temp2,zeros(zRow,zBack));
    twoVal = vertcat(temp3,temp1);
    oathMatrix = cat(3,twoVal,twoVal,twoVal,twoVal);
    stimulus.oath = mglCreateTexture(oathMatrix,[],1);
    clear discard1 discard2 zFront zBack zRow temp1 temp2 temp3 twoVal oathMatrix

for vCount = 1:length(stimulus.positiveBalance);
    
    [discard1 temp1] = mglText(stimulus.positiveBalance{vCount,1});
    [discard2 temp2] = mglText(stimulus.positiveBalance{vCount,2});
    zCol = ceil(size(temp1,2) - size(temp2,2));
    zRow = size(temp2,1);
    temp3 = horzcat(temp2,zeros(zRow,zCol));
    twoVal = vertcat(temp3,temp1);
    clear zRow zCol
    zCol = ceil((900 - length(twoVal))/2);
    zRow = ceil((100 - size(twoVal,1))/2);
    padsize = [zRow,zCol];
    pad = padarray(twoVal,padsize);
    pad = pad(1:100,1:900);
    stimulus.positiveValueMatrix{vCount} = pad;
    clear discard1 discard2 zCol zRow temp1 temp2 temp3 twoVal pad padsize twoVal
    [discard1 temp1] = mglText(stimulus.negativeBalance{vCount,1});
    [discard2 temp2] = mglText(stimulus.negativeBalance{vCount,2});
    zCol = ceil(size(temp1,2) - size(temp2,2));
    zRow = size(temp2,1);
    temp3 = horzcat(temp2,zeros(zRow,zCol));
    twoVal = vertcat(temp3,temp1);
    clear zRow zCol
    zCol = ceil((900 - length(twoVal))/2);
    zRow = ceil((100 - size(twoVal,1))/2);
    padsize = [zRow,zCol];
    pad = padarray(twoVal,padsize);
    pad = pad(1:100,1:900);
    stimulus.negativeValueMatrix{vCount} = pad;
    clear discard1 discard2 zCol zRow temp1 temp2 temp3 twoVal pad padsize twoVal

    
end;









