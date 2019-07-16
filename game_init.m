function [init] = game_init(experiment)
%%%%%�f�B���N�g���̐ݒ�%%%%%
init.maindir = cd;
init.pic_path = [cd,'\picture'];
cd(init.maindir)
addpath(init.pic_path)

%eyetrack���g�����ǂ����i1:�g�p�@0:�s�g�p�j
init.eyetracker_flag = 0;

%�e�����̑I������(sec)
init.limit5 = 5.00;
init.limit = 10.00;
init.limit15 = 15.00;

%data�̐ݒ�
%%%%%%picture��7��9�͎g���Ȃ�%%%%%%
if(experiment == 1)
    %������given�Ŏg��datasets�̎w��
    init.datasets = [33 3 12 29 11 24 16 28 38 19];
elseif(experiment == 2)
    %������selection�Ŏg��dataset�̎w��(1*30�̍s�x�N�g����)
    init.datasets =  [10 25 5 35 8 26 11 33 19 31 12 37 22 14 34 6 24 16 38 18 30 20 3 23 28 15 29 2 36 4];
    %����selection&game�������邩�̐ݒ�
    init.times = 30;
elseif(experiment == 3)
    %������selection�Ŏg��dataset�̎w��(1*4�̍s�x�N�g����)
    init.datasets = [1 15 26 13];
    %����selection&game�������邩�̐ݒ�
    init.times = 30;
elseif(experiment == 4)
    init.datasets = [33 3 12 29 11 24 16 28 38 19];
elseif(experiment == 5)
    %������selection�Ŏg��dataset�̎w��(1*30�̍s�x�N�g����)
    init.datasets = [10 25 5 35 8 26 11 33 19 31 12 37 22 14 34 6 24 16 38 18 30 20 3 23 28 15 29 2 36 4];
    %����selection&game�������邩�̐ݒ�
    init.times = 30;
elseif(experiment == 6)
    %������selection�Ŏg��dataset�̎w��(1*4�̍s�x�N�g����)
    init.datasets = [10 21 32 17];
    %����selection&game�������邩�̐ݒ�
    init.times = 30;
elseif(experiment == 7)
    init.datasets = [33 3 12 29 11 24 16 28 38 19];
elseif(experiment == 8)
    %������selection�Ŏg��dataset�̎w��(1*30�̍s�x�N�g����)
    init.datasets = [10 25 5 35 8 26 11 33 19 31 12 37 22 14 34 6 24 16 38 18 30 20 3 23 28 15 29 2 36 4];
    %����selection&game�������邩�̐ݒ�
    init.times = 30;
elseif(experiment == 9)
    %������selection�Ŏg��dataset�̎w��(1*4�̍s�x�N�g����)
    init.datasets = [8 23 34 37];
    %����selection&game�������邩�̐ݒ�
    init.times = 30;
elseif(experiment == 10)
    init.datasets = [33 3 12 29 11 24 16 28 38 19];
elseif(experiment == 11)
    %������selection�Ŏg��dataset�̎w��(1*30�̍s�x�N�g����)
    init.datasets = [10 25 5 35 8 26 11 33 19 31 12 37 22 14 34 6 24 16 38 18 30 20 3 23 28 15 29 2 36 4];
    %����selection&game�������邩�̐ݒ�
    init.times = 30;
elseif(experiment == 12)
    %������selection�Ŏg��dataset�̎w��(1*4�̍s�x�N�g����)
    init.datasets = [11 22 33 14];
    %����selection&game�������邩�̐ݒ�
    init.times = 30;
end

%sound�̎�荞��
init.snd = audioread('sound1.wav');

load GameQuesData

%�摜�f�[�^�̃��x�����O
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
%�egame�ł̊m�����z
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
        %���l�̃W�����}�Q�[���̋��͂���m����ǂݍ���
        init.sample(i).prob_coordination = GameQuesData.Opponent(i).game1_prisoner_dist(2);
        %���Q�[���̊m�����z��ǂݍ���(1*11)
        init.sample(i).prob_negotiation = GameQuesData.Opponent(i).game2_bargainning_dist;
        %�Ō�ʒ��Q�[���̊m�����z��ǂݍ���(1*11)
        init.sample(i).prob_ultimatum = GameQuesData.Opponent(i).game3_ultimatum_reciever_dist;
    end
end
end