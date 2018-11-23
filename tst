import argparse
import sys

import tensorflow as tf

FLAGS = None


def main(_):
  ps_hosts = FLAGS.ps_hosts.split(",")
  worker_hosts = FLAGS.worker_hosts.split(",")
  print(ps_hosts)
  print(worker_hosts)
