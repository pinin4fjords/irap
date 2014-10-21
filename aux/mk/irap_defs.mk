#; -*- mode: Makefile;-*-
# =========================================================
# Copyright 2012-2014,  Nuno A. Fonseca (nuno dot fonseca at gmail dot com)
#
# This file is part of iRAP.
#
# This is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with iRAP.  If not, see <http://www.gnu.org/licenses/>.
#
#
#    $Id$
# =========================================================
# Macros 
# Code executed after reading the configuration file and before validating the options
# It should be used to override default options


#################
# SOP 
ifdef sop
$(info * sop=$(sop) (overriding some options))
ifeq ($(sop),pawg3_th2_mapping)
$(info * SOP=PAWG3 mapping with TopHat2)
override qc=off
override mapper=tophat2
override species=homo_sapiens
override quant_method=none
override de_method=none
override reference=GRCh37.p13.genome.chr_only.fa
override gtf_file=gencode.v19.annotation.gtf
override max_hits=20

endif

ifeq ($(sop),pawg3_star_mapping)
$(info * SOP=PAWG3 mapping with STAR)
override qc:=off
override mapper:=star
override species:=homo_sapiens
override quant_method:=none
override de_method:=none
override reference:=GRCh37.p13.genome.chr_only.fa
override gtf_file:=gencode.v19.annotation.gtf
override star_index_params:= --sjdbOverhang 100 
override star_map_options:= --outFilterMultimapScoreRange 1  --outFilterMismatchNmax 10 --alignIntronMax 500000 --alignMatesGapMax 1000000 --sjdbScore 2 --alignSJDBoverhangMin 1 --outFilterMatchNminOverLread 0.33 --outFilterScoreMinOverLread 0.33
override max_hits=20
#

endif

endif

##################
# Expression Atlas
ifdef atlas_run
# $(lib)_dir default dir should be $(exp_name)_$(species)
#def_lib_dir=$(name)_$(species)
$(info * atlas_run mode (overriding some options))
raw_folder=$(name)_$(species)
endif