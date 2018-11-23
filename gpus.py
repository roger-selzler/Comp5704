import tensorflow as tf
import numpy as np

tf.reset_default_graph()

# Creates a graph.
a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
b = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[3, 2], name='b')
c = tf.matmul(a, b)
# Creates a session with log_device_placement set to True.
#sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))

with tf.Session(config=tf.ConfigProto(log_device_placement=True)) as sess:
    writer = tf.summary.FileWriter('./graphs',sess.graph)
    # Runs the op.
    print(sess.run(c))
