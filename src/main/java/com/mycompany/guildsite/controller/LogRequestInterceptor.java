package com.mycompany.guildsite.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;


/**
 * Created by User on 08.09.2017.
 */
@Component
public class LogRequestInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = Logger.getLogger(LogRequestInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //logger.debug(request.getContextPath());

        /*ContentCachingRequestWrapper requestCacheWrapperObject
                = new ContentCachingRequestWrapper(request);*/


        //ContentCachingRequestWrapper requestCacheWrapperObject = WebUtils.getNativeRequest(request, ContentCachingRequestWrapper.class);
        //logger.debug("wrapper = "+ requestCacheWrapperObject);
        /*if (requestCacheWrapperObject != null) {
            logger.debug("Wrapper is NOT null");
            while (requestCacheWrapperObject.getParameterNames().hasMoreElements()) {
                logger.debug(requestCacheWrapperObject.getParameterNames().nextElement());
            }
        }*/
        /*if (requestCacheWrapperObject != null) {
            logger.debug("Wrapper is NOT null again");
            byte[] buf = requestCacheWrapperObject.getContentAsByteArray();
            logger.debug("Buf length = "+ buf.length);
            if (buf.length > 0) {
                String payload = new String(buf, 0, buf.length, requestCacheWrapperObject.getCharacterEncoding());
                logger.debug(payload);
            }
        }*/
        logRequest(request);
        logResponse(response);

        return true;
    }

    private void logRequest(final HttpServletRequest request) {
        StringBuilder msg = new StringBuilder();
        msg.append("REQUEST: ");
        /*if (request instanceof ContentCachingRequestWrapper) {
            msg.append("request id=").append(*//*((ContentCachingRequestWrapper) request).getId()*//*id).append("; ");
        }*/
        HttpSession session = request.getSession(false);
        if (session != null) {
            msg.append("session id=").append(session.getId()).append("; ");
        }
        if (request.getMethod() != null) {
            msg.append("method=").append(request.getMethod()).append("; ");
        }
        if (request.getContentType() != null) {
            msg.append("content type=").append(request.getContentType()).append("; ");
        }
        msg.append("uri=").append(request.getRequestURI());
        if (request.getQueryString() != null) {
            msg.append('?').append(request.getQueryString());
        }

        if (request instanceof ContentCachingRequestWrapper && !isMultipart(request) && !isBinaryContent(request)) {
            ContentCachingRequestWrapper requestWrapper = (ContentCachingRequestWrapper) request;
            try {
                String charEncoding = requestWrapper.getCharacterEncoding() != null ? requestWrapper.getCharacterEncoding() :
                        "UTF-8";
                msg.append("; payload=").append(new String(requestWrapper.getContentAsByteArray(), charEncoding));
            } catch (UnsupportedEncodingException e) {
                logger.warn("Failed to parse request payload", e);
            }

        }
        logger.debug(msg.toString());

    }

    private void logResponse(final HttpServletResponse response) {
        ContentCachingResponseWrapper contentCachingResponseWrapper = new ContentCachingResponseWrapper(response);
        StringBuilder msg = new StringBuilder();
        msg.append("RESPONSE: ");
        //msg1.append("request id=").append((response.getId()));
        try {
            msg.append("; payload=").append(new String(contentCachingResponseWrapper.getContentAsByteArray(), contentCachingResponseWrapper.getCharacterEncoding()));
        } catch (UnsupportedEncodingException e) {
            logger.warn("Failed to parse response payload", e);
        }
        logger.debug(msg.toString());
    }

    private boolean isBinaryContent(final HttpServletRequest request) {
        if (request.getContentType() == null) {
            return false;
        }
        return request.getContentType().startsWith("image") || request.getContentType().startsWith("video") || request.getContentType().startsWith("audio");
    }

    private boolean isMultipart(final HttpServletRequest request) {
        return request.getContentType() != null && request.getContentType().startsWith("multipart/form-data");
    }


}
