
clear all
close all

for i={'8P','Encke','ISON','IZ','LS4','MH','PanSTARRS'}

comet_name = i{1};

f  = fopen(strcat('../../Results/',comet_name,'/Chandra_CX_spectrum_',comet_name,'.dat')); 
d  = fscanf(f,'%f %f',[2,inf]); 
d  = d'; 
fO = fopen(strcat('../Observations/',comet_name,'_intensity_Chandra.dat'));
dO = fscanf(fO,'%f %f',[2,inf]);
dO = dO';
fclose('all');

E  = d(:,1); 
I  = d(:,2); 
EO = dO(:,1);
IO = dO(:,2); 

figure
semilogy(E,I,'g',EO,IO,'ks','LineWidth',2.5)
set(gca,'FontSize',16)
xlim([0 1.2])
%ylim([10^-3,1])
%title(strcat(comet_name,' CX Comparison'))
xlabel('Energy [keV]')
ylabel('Counts sec^{-1} keV^{-1}');
legend('CX Model','Observation','Location','NorthEast');
print('-depsc2',strcat('../Chandra_CX_comparison_',comet_name,'.eps'));

clear all
close all
 
end
