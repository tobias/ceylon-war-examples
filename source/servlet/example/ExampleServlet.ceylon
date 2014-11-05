import ceylon.language.meta.declaration {
    ClassDeclaration
}

import javax.servlet {
    ServletConfig
}
import javax.servlet.annotation {
    webServlet
}
import javax.servlet.http {
    HttpServlet,
    HttpServletRequest,
    HttpServletResponse
}

ClassDeclaration metaRefOnClassLoad = `class Array`;

// this is a bit gross - we have to explicitly use urlPatterns instead of the
// default value param for the annonation, due to an ordering limitation in ceylon(?)
webServlet { urlPatterns = { "/" }; }
shared class ExampleServlet() extends HttpServlet() {
    shared actual void init(ServletConfig servletConfig) {}

    shared actual void service(HttpServletRequest request,
        HttpServletResponse response) {
        value metaRef = `class ExampleServlet`;
        value responseBody = "Success! metaRefOnClassLoad: ``metaRefOnClassLoad``, " +
                "metaRef: ``metaRef``";
        response.status = 200;
        response.writer.write(responseBody);
    }
}
