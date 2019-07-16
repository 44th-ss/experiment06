function [init] = game_init(experiment)
%%%%%ディレクトリの設定%%%%%
init.maindir = cd;
init.pic_path = [cd,'\picture'];
cd(init.maindir)
addpath(init.pic_path)

%eyetrackを使うかどうか（1:使用　0:不使用）
init.eyetracker_flag = 0;

%各実験の選択時間(sec)
init.limit5 = 5.00;
init.limit = 10.00;
init.limit15 = 15.00;

%dataの設定
%%%%%%pictureの7と9は使えない%%%%%%
if(experiment == 1)
    %ここでgivenで使うdatasetsの指定
    init.datasets = [33 3 12 29 11 24 16 28 38 19];
elseif(experiment == 2)
    %ここでselectionで使うdatasetの指定(1*30の行ベクトルで)
    init.datasets =  [10 25 5 35 8 26 11 33 19 31 12 37 22 14 34 6 24 16 38 18 30 20 3 23 28 15 29 2 36 4];
    %何回selection&gameをさせるかの設定
    init.times = 30;
elseif(experiment == 3)
    %ここでselectionで使うdatasetの指定(1*4の行ベクトルで)
    init.datasets = [1 15 26 13];
    %何回selection&gameをさせるかの設定
    init.times = 30;
elseif(experiment == 4)
    init.datasets = [33 3 12 29 11 24 16 28 38 19];
elseif(experiment == 5)
    %ここでselectionで使うdatasetの指定(1*30の行ベクトルで)
    init.datasets = [10 25 5 35 8 26 11 33 19 31 12 37 22 14 34 6 24 16 38 18 30 20 3 23 28 15 29 2 36 4];
    %何回selection&gameをさせるかの設定
    init.times = 30;
elseif(experiment == 6)
    %ここでselectionで使うdatasetの指定(1*4の行ベクトルで)
    init.datasets = [10 21 32 17];
    %何回selection&gameをさせるかの設定
    init.times = 30;
elseif(experiment == 7)
    init.datasets = [33 3 12 29 11 24 16 28 38 19];
elseif(experiment == 8)
    %ここでselectionで使うdatasetの指定(1*30の行ベクトルで)
    init.datasets = [10 25 5 35 8 26 11 33 19 31 12 37 22 14 34 6 24 16 38 18 30 20 3 23 28 15 29 2 36 4];
    %何回selection&gameをさせるかの設定
    init.times = 30;
elseif(experiment == 9)
    %ここでselectionで使うdatasetの指定(1*4の行ベクトルで)
    init.datasets = [8 23 34 37];
    %何回selection&gameをさせるかの設定
    init.times = 30;
elseif(experiment == 10)
    init.datasets = [33 3 12 29 11 24 16 28 38 19];
elseif(experiment == 11)
    %ここでselectionで使うdatasetの指定(1*30の行ベクトルで)
    init.datasets = [10 25 5 35 8 26 11 33 19 31 12 37 22 14 34 6 24 16 38 18 30 20 3 23 28 15 29 2 36 4];
    %何回selection&gameをさせるかの設定
    init.times = 30;
elseif(experiment == 12)
    %ここでselectionで使うdatasetの指定(1*4の行ベクトルで)
    init.datasets = [11 22 33 14];
    %何回selection&gameをさせるかの設定
    init.times = 30;
end

%soundの取り込み
init.snd = audioread('sound1.wav');

load GameQuesData

%画像データのラベリング
init.sample(1).picture = imread('1.jpg');
init.sample(2).picture = imread('2.jpg');
init.sample(3).picture = imread('3.jpg');
init.sample(4).picture = imread('4.jpg');
init.sample(5).picture = imread('5.jpg');
init.sample(6).picture = imread('6.jpg');
init.sample(8).picture = imread('8.jpg');
init.sample(10).picture = imread('10.jpg');
init.sample(11).picture = imread('11.jpg');
init.sample(12).picture = imread('12.jpg');
init.sample(13).picture = imread('13.jpg');
init.sample(14).picture = imread('14.jpg');
init.sample(15).picture = imread('15.jpg');
init.sample(16).picture = imread('16.jpg');
init.sample(17).picture = imread('17.jpg');
init.sample(18).picture = imread('18.jpg');
init.sample(19).picture = imread('19.jpg');
init.sample(20).picture = imread('20.jpg');
init.sample(21).picture = imread('21.jpg');
init.sample(22).picture = imread('22.jpg');
init.sample(23).picture = imread('23.jpg');
init.sample(24).picture = imread('24.jpg');
init.sample(25).picture = imread('25.jpg');
init.sample(26).picture = imread('26.jpg');
init.sample(27).picture = imread('27.jpg');
init.sample(28).picture = imread('28.jpg');
init.sample(29).picture = imread('29.jpg');
init.sample(30).picture = imread('30.jpg');
init.sample(31).picture = imread('31.jpg');
init.sample(32).picture = imread('32.jpg');
init.sample(33).picture = imread('33.jpg');
init.sample(34).picture = imread('34.jpg');
init.sample(35).picture = imread('35.jpg');
init.sample(36).picture = imread('36.jpg');
init.sample(37).picture = imread('37.jpg');
init.sample(38).picture = imread('38.jpg');
%各gameでの確率分布
for i = 1:38
    if(i == 7)
        init.sample(7).prob_coordination = NaN;
        init.sample(7).prob_negotiation = NaN;
        init.sample(7).prob_ultimatum = NaN;
    elseif(i == 9)
        init.sample(9).prob_coordination = NaN;
        init.sample(9).prob_negotiation = NaN;
        init.sample(9).prob_ultimatum = NaN;
    else
        %囚人のジレンマゲームの協力する確率を読み込む
        init.sample(i).prob_coordination = GameQuesData.Opponent(i).game1_prisoner_dist(2);
        %交渉ゲームの確率分布を読み込む(1*11)
        init.sample(i).prob_negotiation = GameQuesData.Opponent(i).game2_bargainning_dist;
        %最後通牒ゲームの確率分布を読み込む(1*11)
        init.sample(i).prob_ultimatum = GameQuesData.Opponent(i).game3_ultimatum_reciever_dist;
    end
end
end