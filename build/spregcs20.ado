 program define spregcs20
 version 11.0
 qui {
 args lf XB Rho1 Rho2 Rho3 Rho4 Sigma
 tempvar Ro1 Ro2 Ro3 Ro4 rYW1 rYW2 rYW3 rYW4 D0 D1
 gen `D0'=0
 gen `D1'=0
 replace `D0' =1 if $ML_y1 ==spat_llt
 replace `D1' =1 if $ML_y1 > spat_llt
 gen double `Ro1' =`Rho1'*mstar_W1
 gen double `Ro2' =`Rho2'*mstar_W2
 gen double `Ro3' =`Rho3'*mstar_W3
 gen double `Ro4' =`Rho4'*mstar_W4
 gen double `rYW1'=`Rho1'*w1y_$ML_y1
 gen double `rYW2'=`Rho2'*w2y_$ML_y1
 gen double `rYW3'=`Rho3'*w3y_$ML_y1
 gen double `rYW4'=`Rho4'*w4y_$ML_y1
 replace `lf'=log(1-`Ro1'-`Ro2'-`Ro3'-`Ro4') ///
 +`D1'*((($ML_y1-`rYW1'-`rYW2'-`rYW3'-`rYW4'-`XB')/`Sigma') ///
 -exp(($ML_y1-`rYW1'-`rYW2'-`rYW3'-`rYW4'-`XB')/`Sigma')) ///
 -`D0'*exp(($ML_y1-`rYW1'-`rYW2'-`rYW3'-`rYW4'-`XB')/`Sigma')-`D1'*log(`Sigma')
 }
 end

