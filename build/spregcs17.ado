 program define spregcs17
 version 11.0
 qui {
 args lf XB ZB Rho1 Rho2 Rho3 Sigma
 tempvar Ro1 Ro2 Ro3 rYW1 rYW2 rYW3 D0 D1
 gen `D0'=0
 gen `D1'=0
 replace `D0' =1 if $ML_y1 ==spat_llt
 replace `D1' =1 if $ML_y1 > spat_llt
 gen double `Ro1' =`Rho1'*mstar_W1
 gen double `Ro2' =`Rho2'*mstar_W2
 gen double `Ro3' =`Rho3'*mstar_W3
 gen double `rYW1'=`Rho1'*w1y_$ML_y1
 gen double `rYW2'=`Rho2'*w2y_$ML_y1
 gen double `rYW3'=`Rho3'*w3y_$ML_y1
 replace `lf' = log(1-`Ro1'-`Ro2'-`Ro3') ///
 +`D0'*log(normal(-(`rYW1'+`rYW2'+`rYW3'+`XB')/((`Sigma'*exp(`ZB'))))) ///
 -0.5*log(2*_pi)-0.5*log(((`Sigma'*exp(`ZB')))^2) ///
 -0.5*`D1'*($ML_y1-`rYW1'-`rYW2'-`rYW3'-`XB')^2/((`Sigma'*exp(`ZB')))^2
 }
 end
