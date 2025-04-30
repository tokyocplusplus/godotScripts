using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playermov : MonoBehaviour
{
    public float Speed;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        handleInput();
    }

    void handleInput() {
        if (Input.GetKey(KeyCode.W)) {
            transform.Translate(Vector3.forward * Speed * Time.deltaTime);
            Console.WriteLine("i hate this project");
        }
        if (Input.GetKey(KeyCode.S)) {
            transform.Translate(Vector3.back * Speed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.D)) {
            transform.Translate(Vector3.right * Speed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.A)) {
            transform.Translate(Vector3.left * Speed * Time.deltaTime);
        }
    }
}
