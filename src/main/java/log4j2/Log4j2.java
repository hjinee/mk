package log4j2;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Log4j2 {

    protected static Logger logger = LoggerFactory.getLogger(Log4j2.class.getName());

    public void llog(String str) {

    //DEBUG < INFO < WARN < ERROR < FATAL

        // logger.fatal("log4j:logger.fatal()");

        logger.error("log4j:logger.error()"+str);

        logger.warn("log4j:logger.warn()"+str);

        logger.info("log4j:logger.info()"+str);

        logger.debug("log4j:logger.debug()"+str);
    }
}
