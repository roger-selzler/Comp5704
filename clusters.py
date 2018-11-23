import tensorflow as tf
import numpy as np


import multiprocessing # used to count the number of cores with function cpu_count()

tasks=["192.168.6.19:2222","192.168.6.20:2222"]
#tasks=["134.117.217.26:2222", "134.117.217.27:2222"]

cluster = tf.train.ClusterSpec({"local": tasks})
#server = tf.train.Server(cluster, job_name="local", task_index=0)


# the workers will do the job, whereas the Parameter server will updated the weights of the NN
'''tf.train.ClusterSpec({
    "worker": [
        "134.117.217.27:2222", #134.117.217.27 (GPU2)
        "134.117.217.28:2222",
        "134.117.217.30:2222"
    ],
    "ps": [
        "ps0.example.com:2222",
        "ps1.example.com:2222"
    ]})
'''


server1 = tf.train.Server(cluster, job_name="local", task_index=0)

server2 = tf.train.Server(cluster, job_name="local", task_index=1)


tf.reset_default_graph()
var = tf.Variable(initial_value=0.0, name='var')
sess1 = tf.Session(server1.target)
sess2 = tf.Session(server2.target)

sess1.run(tf.global_variables_initializer())
sess2.run(tf.global_variables_initializer())

print("Initial value of var in session 1:", sess1.run(var))
print("Initial value of var in session 2:", sess2.run(var))

sess1.run(var.assign_add(1.0))
print("Incremented var in session 1")

print("Value of var in session 1:", sess1.run(var))
print("Value of var in session 2:", sess2.run(var))


