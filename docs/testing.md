# Testing

To be discussed.

There is currently no value in adding automated tests, due to the simplicity of this PoC, and in order to deliver value quickly.

I'm happy to elaborate on the approach and technology used for the below tests, which would be required for a real website with regular updates.

* Infrastructure validation
  * Have the expected resources been deployed?
  * Have the expected resources been secured, i.e. do they have the expected properties (e.g. S3 bucket is private)?
  * Has the logging and monitoring been configured appropriately?
  * Ongoing testing - configuration drift detection (monitoring and alerting)

* Basic website validation
  * Liveness test - is the website live?
  * Readyness test - is the website ready? (where applicable)
