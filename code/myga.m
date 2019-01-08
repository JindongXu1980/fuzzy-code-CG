LIND = 15; % Length of individual vars.
NVAR = 2; % No. of decision variables
NIND = 40; % No. of individuals
GGAP = 0.9; % Generation gap
XOV = 0.7; % Crossover rate
MUTR = 0.0175; % Mutation rate
MAXGEN = 30; % No. of generations
% Binary representation scheme
FieldD = [LIND LIND; 1 1; 1000 1000; 1 1; 0 0; 0 0; 0 0];
% Initialise population
Chrom = crtbp(Nind, Lind*NVAR); % Create binary population
ObjV = objfun(bs2rv(Chrom, FieldD)); % Evaluate objective fn.
Gen = 0; % Counter
% Begin generational loop
while Gen < MAXGEN
% Assign fitness values to entire population
FitnV = ranking(ObjV);
% Visualisation
plotgraphics
% Select individuals for breeding
SelCh = select('sus', Chrom, FitnV, GGAP);
% Recombine individuals (crossover)
SelCh = recombin('xovsp', SelCh, XOV);
% Apply mutation
SelCh = mut(SelCh, MUTR);
% Evaluate offspring, call objective function
ObjVSel = objfun(bs2rv(SelCh, FieldD));
% Reinsert offspring into population
[Chrom ObjV]=reins(Chrom, SelCh, 1, 1, ObjV, ObjVSel);
% Increment counter
Gen = Gen+1;
end
% Convert Chrom to real-values
Phen = bs2rv(Chrom, FieldD);