%lan_read,�����ļ���Ϊ"*.lan"��Landsat����
function [lan_data,nbands] = lan_read(lan_filename)

fid = fopen(lan_filename,'r');

%���Ƿ�ͼ��7���Σ����ļ���С��ȷ��ͼ�ĳߴ�
nbands = 6;
fseek(fid,0,'eof');
file_bytes = ftell(fid);
nlines = floor(sqrt(file_bytes/nbands));
nsamples = nlines;

%���ļ�ͷ
nbytes_header = 128;
fseek(fid,nbytes_header,'bof');

%���������������ѳߴ��С�ľ�����
A = fread(fid,[nsamples nlines*nbands],'uint8');

fclose(fid);

A_3dim = reshape(A,nsamples,nbands,nlines);
lan_data = permute(A_3dim,[3 1 2]);

%--------------------------------------------------------------------------



