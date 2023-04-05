input_file=/scratch/bash_course/lecture_4/retake/genomes.txt

output_dir=~/final_assignment_anouk_resit
cd $output_dir
1> log.txt
cd ~

source $(dirname $(dirname $(which mamba)))/etc/profile.d/conda.sh
mamba create --name alignment genomepy STAR 
conda activate alignment

for line in $(cat $input_file); do
echo $line >> $output_dir/log.txt
nice genomepy install $line
nice STAR --runMode genomeGenerate --genomeFastaFiles .local/share/genomes/$line/$line.fa --genomeDir $output_dir/$line
1>> $output_dir/log.txt;
done 


echo  Anouk van den Elzen 
 










