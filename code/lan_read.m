%lan_read,读入文件名为"*.lan"的Landsat数据
function [lan_data,nbands] = lan_read(lan_filename)

fid = fopen(lan_filename,'r');

%假是方图像，7波段，据文件大小来确定图的尺寸
nbands = 6;
fseek(fid,0,'eof');
file_bytes = ftell(fid);
nlines = floor(sqrt(file_bytes/nbands));
nsamples = nlines;

%跳文件头
nbytes_header = 128;
fseek(fid,nbytes_header,'bof');

%按类型入数放入已尺寸大小的矩阵中
A = fread(fid,[nsamples nlines*nbands],'uint8');

fclose(fid);

A_3dim = reshape(A,nsamples,nbands,nlines);
lan_data = permute(A_3dim,[3 1 2]);

%--------------------------------------------------------------------------



