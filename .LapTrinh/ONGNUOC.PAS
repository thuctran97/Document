uses    math;
const
        fi='ONGNUOC.INP';
        fo='ONGNUOC.OUT';
        w= (sqrt(3))/2;
var     f,g: text;
        a,b: real;
        dem,dem2: byte;
function tinh(xx,yy: real; k: byte): integer;
var     i,hang: byte;
        t: real;
        s: integer;
begin
        t:= 0.5; hang:= 1;
        while t+w+0.5<= xx do
        begin
           t:= t+w;
           inc(hang);
           if (xx-t<w) and (xx-t>=0.5) then break;
        end;
        if xx<1 then exit(0);
        if hang=1 then exit(k);
        S:= 0;
        for i:= 1 to hang do
        if i mod 2 =1 then s:= s+k else
        begin
           s:= s+k-1;
           if k+0.5<= yy then inc(s);
        end;
        exit(s);
end;
PROCEDURE demhc(x,y: real);
begin
        dem:= 0; dem2:= 0;
        while dem+1<=x do
        begin
                inc(dem);
                if dem>x then begin dec(dem); break; end;
        end;
        while dem2+1<=y do
        begin
                inc(dem2);
                if dem2>y then begin dec(dem2); break; end;
        end;
end;
procedure xuly(x,y: real);
var
        s1,s2,s3,ans: integer;
begin
        demhc(x,y);
        s1:= dem*dem2;
        s2:= tinh(x,y,dem2);
        s3:= tinh(y,x,dem);
        ans:= max(s2,s3);
        if s1>= ans then writeln(g,s1,' grid') else
        writeln(g,ans,' skew');
end;
begin
        assign(f,fi); reset(f);
        assign(g,fo); rewrite(g);
        while not eof(f) do
        begin
           readln(f,a,b);
           xuly(a,b);
        end;
        close(f); close(g);
end.
