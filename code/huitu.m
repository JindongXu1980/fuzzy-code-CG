clear;

clc;

num=[16 25 36  49  64 81 100];

optimal=[3.47084 2.8001 2.9235 2.13214 2.36128 1.83864 1.99].*10^-1; 

fbr=[3.4558 2.90852 2.9581 2.2274 2.39666 2.21078 2.13].*10^-1;

VBF=[5.35458 4.42722 4.28474 3.81738 4.008 3.29178 3.02486].*10^-1;

DFR=[5.92 5.6 4.7 4.1 3.1 3.1 2.6 ]*10^-1;

plot(num,optimal,'ro-',num,fbr,'b*-',num,VBF,'k>-',num,DFR,'g.-','linewidth',2)

xlabel('The Number of nodes')

ylabel('Consumed Energy¡§J')

grid on

legend('Proposed Scheme','FBR','VBF','DFR')