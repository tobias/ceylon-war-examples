import ceylon.interop.java {
    javaString
}
import ceylon.language.meta.declaration {
    ClassDeclaration
}

import javax.ws.rs {
    path,
    gET,
    pathParam
}
import javax.ws.rs.core {
    Response
}

ClassDeclaration metaRefOnClassLoad = `class Array`;

path("/rest")
shared class ExampleRestService() {
    // this annotation is a bit gross
    gET
    path("/{param}")
    shared default Response generateMessage(pathParam("param") String msg) {
        value metaRef = `class ExampleRestService`;
        value response = "response - msg: ``msg``, " +
                "metaRefOnClassLoad: ``metaRefOnClassLoad``, " +
                "metaRef: ``metaRef``";

        // we have to coerce to a java String or RESTEasy will give an error
        // since it doesn't have a MessageBodyWriter for ceylon.language.String
        return Response.status(200).entity(javaString(response)).build();
    }
}
