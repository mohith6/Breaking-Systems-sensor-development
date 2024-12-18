
-- Author:              A. Ireland
--
-- Address:             School Mathematical & Computer Sciences
--                      Heriot-Watt University
--                      Edinburgh, EH14 4AS
--
-- E-mail:              a.ireland@hw.ac.uk
--
-- Last modified:       10.9.2022
--
-- Filename:            log.ads
--
-- Description:         Provides logger that records state information on the
--                      component parts of the BSCU at run-time.

-- with Spark_IO;
pragma SPARK_Mode (Off);
package Log is
   
  procedure Crash;
   
  procedure Update;

  procedure Open_File;

  procedure Close_File;

end Log;



