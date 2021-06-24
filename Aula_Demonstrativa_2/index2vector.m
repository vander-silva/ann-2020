function [vector] = index2vector(index,vect_size)
vector = zeros(vect_size,1);
vector(index) = 1;
end