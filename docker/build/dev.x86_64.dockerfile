FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

LABEL version="1.0"

ENV DEBIAN_FRONTEND=noninteractive

# Run installer 
COPY installers /tmp/installers
RUN bash /tmp/installers/config_gcc.sh
RUN bash /tmp/installers/install_bazel.sh
RUN bash /tmp/installers/install_gflags_glog.sh
RUN bash /tmp/installers/install_protobuf.sh
RUN bash /tmp/installers/install_bazel_packages.sh
RUN bash /tmp/installers/install_google_styleguide.sh
RUN bash /tmp/installers/install_node.sh
RUN bash /tmp/installers/install_python_modules.sh
RUN bash /tmp/installers/install_yarn.sh
RUN bash /tmp/installers/install_glew.sh
RUN bash /tmp/installers/install_ipopt.sh
RUN bash /tmp/installers/install_qp_oases.sh
RUN bash /tmp/installers/install_osqp.sh
RUN bash /tmp/installers/install_nlopt.sh
RUN bash /tmp/installers/install_openh264.sh
RUN bash /tmp/installers/install_boost54.sh
RUN bash /tmp/installers/install_fast-rtps.sh
RUN bash /tmp/installers/install_pcl.sh
RUN bash /tmp/installers/install_adv_plat.sh
RUN bash /tmp/installers/install_conda.sh
RUN bash /tmp/installers/install_libjsonrpc-cpp.sh
RUN bash /tmp/installers/install_bosfs.sh
RUN bash /tmp/installers/install_ffmpeg.sh
RUN bash /tmp/installers/cleanup.sh

WORKDIR /apollo
#USER apollo
