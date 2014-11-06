import ceylon.interop.java {
    javaString
}
import ceylon.language.meta.declaration {
    ClassDeclaration
}

import javax.ws.rs {
    path,
    pathParam,
    get=gET
}
import javax.ws.rs.core {
    Response
}

ClassDeclaration metaRefOnClassLoad = `class Array`;

path("/rest")
shared class ExampleRestService() {
    //we alias gET to get above to make things prettier
    get
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
