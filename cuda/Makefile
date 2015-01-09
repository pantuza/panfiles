# Make file for NVIDIA Cuda


# defines the shell to the make application
SHELL := /bin/bash


# Cuda repository RPM 
DISTRO := opensuse123-6.0
VERSION := 37
ARCH := x86_64
RPM_NAME := cuda-repo-$(DISTRO)-$(VERSION).$(ARCH).rpm


# Site to download
DOMAIN := http://developer.download.nvidia.com
SITE_DIR := compute/cuda/repos/opensuse123/$(ARCH)


# RPM url
RPM := $(DOMAIN)/$(SITE_DIR)/$(RPM_NAME)



# Evironment variables
PROFILE := /etc/profile.local
CUDA_PATH := /usr/local/cuda-6.0/bin
LD_PATH := /usr/local/cuda-6.0/lib64


.PHONY := install


install:
	@echo -e "\n$(BROWN)# NVIDIA CUDA INSTALL$(END_COLOR)"
	@wget $(RPM)
	@sudo rpm --install $(RPM_NAME)
	@sudo zypper refresh
	@sudo zypper in cuda
	@sudo usermod -a -G video $(shell whoami)
	@echo "export PATH=$(CUDA_PATH):$$PATH" >> $(PROFILE)
	export PATH=$(CUDA_PATH):$$PATH
	@echo "export LD_LIBRARY_PATH=$(LD_PATH):$$LD_LIBRARY_PATH" >> $(PROFILE)
	export LD_LIBRARY_PATH=$(LD_PATH):$$LD_LIBRARY_PATH
	@echo -e "$(BROWN)**\n$(END_COLOR)"




