function stop = outfun(x,optimValues,state)
     global h
     stop = false;
     switch state
         case 'iter'
             h.fval = [h.fval; optimValues.fval];
             h.x = [h.x; x];
         otherwise
     end
 end
