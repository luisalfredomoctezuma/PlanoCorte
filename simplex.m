function[A, subs, x, z] = simplex(type, c, A, b)
%                    min(max) z = c*x
%                 Subject to: Ax <= b
%                              x >= 0


if any(b < 0)
   error(' Right hand sides of the constraint set must be nonnegative.')
end
if type == 'min'
   tp = -1;
else
   tp = 1;
   c = -c;
end
[m, n] = size(A);
A = [A eye(m)];
b = b(:);
c = c(:)';
A = [A b];
d = [c zeros(1,m+1)];
A = [A;d];
if nargin == 5
   disp(sprintf('     ________________________________________________'))
   disp(sprintf('\n              Tableaux of the Simplex Algorithm'))
   disp(sprintf('     ________________________________________________'))
   disp(sprintf('\n                  Initial tableau\n'))
   A
   disp(sprintf(' Press any key to continue ...\n\n'))
   pause
end
[mi, col] = Br(A(m+1,1:m+n));
subs = n+1:m+n;
while ~isempty(mi) & mi < 0 & abs(mi) > eps
   t = A(1:m,col);
   if all(t <= 0)
      disp(sprintf('\n       El  problema tiene función objetivo sin límites'));
      x = zeros(n,1);
      if tp == -1
         z = -inf;
      else
         z = inf;
      end
      return;
   end
   row = MRT(A(1:m,m+n+1),A(1:m,col));
   if ~isempty(row)
      A(row,:)= A(row,:)/A(row,col);
      subs(row) = col;
      for i = 1:m+1
         if i ~= row
            A(i,:)= A(i,:)-A(i,col)*A(row,:);
         end
      end
   end
   [mi, col] = Br(A(m+1,1:m+n));
end


z = tp*A(m+1,m+n+1);
x = zeros(1,m+n);
x(subs) = A(1:m,m+n+1);
x = x(1:n)';

if nargin == 5
   disp(sprintf('\n\n                  Final tableau'))
   A
   disp(sprintf(' Presiona una tecla para continuar...\n'))
   pause
end
