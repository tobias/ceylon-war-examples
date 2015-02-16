import ceylon.language.meta.declaration {
    ClassDeclaration
}
import javax.inject {
    inject, inject__FIELD
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
inject shared class ExampleServlet(Something constructorInjected) extends HttpServlet() {
    inject__FIELD shared variable Something? fieldInjected = null;

    shared actual void init(ServletConfig servletConfig) {}

    shared actual void service(HttpServletRequest request,
        HttpServletResponse response) {
        value metaRef = `class ExampleServlet`;
        assert(exists it=fieldInjected);
        value responseBody = "Success!\n" +
                "metaRefOnClassLoad: ``metaRefOnClassLoad``\n" +
                "metaRef: ``metaRef``\n" +
                "constructorInjected: ``constructorInjected.message()``\n" +
                "fieldInjected: ``it.message()``\n";
        response.status = 200;
        response.writer.write(responseBody);
    }
}
