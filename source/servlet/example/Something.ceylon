import javax.inject {
    inject, inject__FIELD
}

inject shared class Something(SomethingElse constructorInjected) {
    inject__FIELD shared variable SomethingElse? fieldInjected = null;

    variable SomethingElse? methodInjected = null;

    inject shared void injectCeylonObject(SomethingElse obj) {
        print("``obj`` method injected");
        methodInjected = obj;
    }

    shared String message() {
        assert(exists it=methodInjected);
        assert(exists it2=fieldInjected);
        return "Something: contstructorInjected: ``constructorInjected``, " +
                "methodInjected: ``it``, " +
                "fieldInjected: ``it2``";
    }
}