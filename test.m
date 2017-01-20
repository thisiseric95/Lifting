vidObj = VideoWriter('IMG_0410.mov'); 
nFrames = vidObj.NumberOfFrames;
vidHeight = vidObj.Height; 
vidWidth = vidObj.Width;

mov(1:nFrames)= struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'), 'colormap' ,[]);
for i = 1 : nFrames
  mov(i).cdata = read(vidObj, i); 
end

% Assuming first couple of frames can be used as background
% Assuming fixed camera and stable backgrouend
% Say we take the first 5 frames to create th background
BG = mean(mov(1:5);
threshold = 64;

for i = frameBG+1 : nFrames
  diff = mov(i) - BG;
  if diff >= threshold
    th = 1;
  else th = 0;
  end
end
  
