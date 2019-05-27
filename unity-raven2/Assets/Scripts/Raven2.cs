using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RosSharp.RosBridgeClient;
using sensor_msgs = RosSharp.RosBridgeClient.Messages.Sensor;


public class Raven2 : MonoBehaviour
{
    RosSocket rosSocket;

    // Start is called before the first frame update
    void Start()
    {
        // Subscribe once to joint_states ROS topic for raven2 robot
        rosSocket = GameObject.Find("ROSConnection").GetComponent<ROSConnection>().getRosSocket();
        string subscription_id = rosSocket.Subscribe<sensor_msgs.JointState>("/joint_states", JointStateHandler);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private static void JointStateHandler(sensor_msgs.JointState message)
    {
        Debug.Log((message).name[0]);
    }
}
