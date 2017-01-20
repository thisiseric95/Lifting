vidObj = VideoWriter('IMG_0410.mov'); 
nFrames = vidObj.NumberOfFrames;
vidHeight = vidObj.Height; 
vidWidth = vidObj.Width;

mov(1:nFrames)= struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'))
for i = 1 : nFrames
  mov(i).cdata = read(vidObj, i); 
end

% Assuming first couple of frames can be used as background
% Assuming fixed camera and stable background

frameBG = 5;
threshold = 64;
BG = mov(frameBG);

for i = frameBG+1 : nFrames
  diff = mov(i) - BG;
  if diff >= threshold
    th = 1;
  else th = 0;
  end
end
  
