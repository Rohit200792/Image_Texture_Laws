function T = Image_Texture_Laws(image)
% CS6640_Laws - compute texture parameters
% On input:
%       im (MxN array): input image
% On output:
%       T (M*Nx10 array): texture parameters
%           each texture parameter is a column vector in T
% Call:
%       T = Image_Texture_Laws(im);
% Author:
%       Rohit Singh
%       UU
%       Fall 2018
%
imageGray = mat2gray(double(rgb2gray(image)));
L7 = [1 6 15 20 15 6 1];
E7 = [-1 -4 -5 0 5 4 1];
S7 = [-1 -2 1 4 1 -2 -1];
W7 = [-1 0 3 0 -3 0 1];
R7 = [1 -2 -1 4 -1 -2 1];
O7 = [-1 6 -15 20 -15 6 -1];

L7L7 = L7'*L7;
L7E7 = L7'*E7;
L7S7 = L7'*S7;
L7W7 = L7'*W7;
L7R7 = L7'*R7;
L7O7 = L7'*O7;
E7E7 = E7'*E7;
W7R7 = W7'*R7;
W7O7 = W7'*O7;
M7 = fspecial('average',7);

IL7L7 = conv2(L7L7,imageGray);
IL7E7 = conv2(L7E7,imageGray);
IL7S7 = conv2(L7S7,imageGray);
IL7W7 = conv2(L7W7,imageGray);
IL7R7 = conv2(L7R7,imageGray);
IL7O7 = conv2(L7O7,imageGray);
IE7E7 = conv2(E7E7,imageGray);
IW7R7 = conv2(W7R7,imageGray);
IW7O7 = conv2(W7O7,imageGray);
IM7 = conv2(M7,imageGray);
%{
imshow(IL7L7); 
imshow(IL7E7); 
imshow(IL7S7);
imshow(IL7W7); 
imshow(IL7R7);
imshow(IL7O7);
imshow(IE7E7);
imshow(IW7R7);
imshow(IW7O7);
imshow(IM7);
%}
ImeanL7L7 = conv2(abs(IL7L7),M7);
ImeanL7E7 = conv2(abs(IL7E7),M7);
ImeanL7S7 = conv2(abs(IL7S7),M7);
ImeanL7W7 = conv2(abs(IL7W7),M7);
ImeanL7R7 = conv2(abs(IL7R7),M7);
ImeanL7O7 = conv2(abs(IL7O7),M7);
ImeanE7E7 = conv2(abs(IE7E7),M7);
ImeanW7R7 = conv2(abs(IW7R7),M7);
ImeanW7O7 = conv2(abs(IW7O7),M7);
ImeanM7 = conv2(abs(IM7),M7);
%{
imshow(ImeanL7L7); 
imshow(ImeanL7E7); 
imshow(ImeanL7S7);
imshow(ImeanL7W7); 
imshow(ImeanL7R7);
imshow(ImeanL7O7);
imshow(ImeanE7E7);
imshow(ImeanW7R7);
imshow(ImeanW7O7);
imshow(ImeanM7);
%}
imgrow = size(ImeanM7,1);
imgcol = size(ImeanM7,2);
rowcol = imgrow*imgcol;
texture = zeros(rowcol,10);

texture(:,1)=reshape(ImeanL7L7,rowcol,1);
texture(:,2)=reshape(ImeanL7E7,rowcol,1);
texture(:,3)=reshape(ImeanL7S7,rowcol,1);
texture(:,4)=reshape(ImeanL7W7,rowcol,1);
texture(:,5)=reshape(ImeanL7R7,rowcol,1);
texture(:,6)=reshape(ImeanL7O7,rowcol,1);
texture(:,7)=reshape(ImeanE7E7,rowcol,1);
texture(:,8)=reshape(ImeanW7R7,rowcol,1);
texture(:,10)=reshape(ImeanM7,rowcol,1);

T=texture;


%IDX=kmeans(T,4);  %cluster indexes using kmeans to get segmented regions
%imgSeg=reshape(IDX,492,652); %replace 492,652 with appropriate image size

%image=imread('C:\Users\Rohit Singh\OneDrive\MSCS\CS6640 Image
%Processing\Practise\08-30-18_16-31-53-160.jpg');