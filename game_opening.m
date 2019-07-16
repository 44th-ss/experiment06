clear all
cd
addpath('picture')
%被験者の情報入力
prompt = {'number;','name:','age:','sex(male:1 female:0):','What games do you play?(game1-12):'};
title = 'Opening';
answer = inputdlg(prompt, title);

%保存場所の確認
game = str2num(answer{5});

if(game == 1)
    existance = exist('coordination_given.mat');
    if(existance == 0)
        number = 1;
    else
        load coordination_given
        number = length(data) + 1;
    end
elseif(game == 2)
    existance = exist('coordination_selection30.mat');
    if(existance == 0)
        
        number = 1;
    else
        load coordination_selection30
        number = length(data) + 1;
    end
elseif(game == 3)
    existance = exist('coordination_selection4.mat');
    if(existance == 0)
        number = 1;
    else
        load coordination_selection4
        number = length(data) + 1;
    end
elseif(game == 4)
    existance = exist('negotiation_given.mat');
    if(existance == 0)
        number = 1;
    else
        load negotiation_given
        number = length(data) + 1;
    end
elseif(game == 5)
    existance = exist('negotiation_selection30.mat');
    if(existance == 0)
        number = 1;
    else
        load negotiation_selection30
        number = length(data) + 1;
    end
elseif(game == 6)
    existance = exist('negotiation_selection4.mat');
    if(existance == 0)
        number = 1;
    else
        load negotiation_selection4
        number = length(data) + 1;
    end
elseif(game == 7)
    existance = exist('ultimatum_given.mat');
    if(existance == 0)
        number = 1;
    else
        load ultimatum_given
        number = length(data) + 1;
    end
elseif(game == 8)
    existance = exist('ultimatum_selection30.mat');
    if(existance == 0)
        number = 1;
    else
        load ultimatum_selection30
        number = length(data) + 1;
    end
elseif(game == 9)
    existance = exist('ultimatum_selection4.mat');
    if(existance == 0)
        number = 1;
    else
        load ultimatum_selection4
        number = length(data) + 1;
    end
elseif(game == 10)
    existance = exist('dictator_given.mat');
    if(existance == 0)
        number = 1;
    else
        load dictator_given
        number = length(data) + 1;
    end
elseif(game == 11)
    existance = exist('dictator_selection30.mat');
    if(existance == 0)
        number = 1;
    else
        load dictator_selection30
        number = length(data) + 1;
    end
elseif(game == 12)
    existance = exist('dictator_selection4.mat');
    if(existance == 0)
        number = 1;
    else
        load dictator_selection4
        number = length(data) + 1;
    end
end

data(number).gakuseki = str2num(answer{1});
data(number).name = answer{2};
data(number).age = str2num(answer{3});
data(number).sex = answer{4};
data(number).game = str2num(answer{5}); %1:coordinations'(given)  2:coordinations'(selection30)  3:coordinations'(selection4)
                                        %4:negotiation(given) 5:negotiation(selection30) 6:negotiation(selection4)
                                        %7:ultimatum(given)   8:ultimatum(selection30)   9:ultimatum(selection4)
                                        %10:dictator(given)
                                        %11:dictator(selection30) 12:dictator(selection4)
data(number).date = clock;
                                        
matfile_name1 = 'coordination_given';
matfile_name2 = 'coordination_selection30';
matfile_name3 = 'coordination_selection4';
matfile_name4 = 'negotiation_given';
matfile_name5 = 'negotiation_selection30';
matfile_name6 = 'negotiation_selection4';
matfile_name7 = 'ultimatum_given';
matfile_name8 = 'ultimatum_selection30';
matfile_name9 = 'ultimatum_selection4';
matfile_name10 = 'dictator_given';
matfile_name11 = 'dictator_selection30';
matfile_name12 = 'dictator_selection4';


%構造体の作成
if(data(number).game == 1)
    save(matfile_name1,'data')
elseif(data(number).game == 2)
    save(matfile_name2,'data')
elseif(data(number).game == 3)
    save(matfile_name3,'data')
elseif(data(number).game == 4)
    save(matfile_name4,'data')
elseif(data(number).game == 5)
    save(matfile_name5,'data')
elseif(data(number).game == 6)
    save(matfile_name6,'data')
elseif(data(number).game == 7)
    save(matfile_name7,'data')
elseif(data(number).game == 8)
    save(matfile_name8,'data')
elseif(data(number).game == 9)
    save(matfile_name9,'data')
elseif(data(number).game == 10)
    save(matfile_name10,'data')
elseif(data(number).game == 11)
    save(matfile_name11,'data')
elseif(data(number).game == 12)
    save(matfile_name12,'data')
end

%gameの選択
if(data(number).game == 1)
    clear all
    run('game_given');
    close('game_opening.m');
elseif(data(number).game == 2)
    clear all
    run('game_selection');
    close('game_opening.m');
elseif(data(number).game == 3)
    clear all
    run('game_selection4');
    close('game_opening.m');
elseif(data(number).game == 4)
    clear all
    run('negotiation_given');
    close('game_opening.m');
elseif(data(number).game == 5)
    clear all
    run('negotiation_selection30')
    close('game_opening.m');
elseif(data(number).game == 6)
    clear all
    run('negotiation_selection4')
    close('game_opening.m');
elseif(data(number).game == 7)
    clear all
    run('ultimatum_given')
    close('game_opening.m');
elseif(data(number).game == 8)
    clear all
    run('ultimatum_selection30')
    close('game_opening.m');
elseif(data(number).game == 9)
    clear all
    run('ultimatum_selection4')
    close('game_opening.m');
elseif(data(number).game == 10)
    clear all
    run('dictator_given')
    close('game_opening.m');
elseif(data(number).game == 11)
    clear all
    run('dictator_selection30')
    close('game_opening.m');
elseif(data(number).game == 12)
    clear all
    run('dictator_selection4')
    close('game_opening.m');
end
