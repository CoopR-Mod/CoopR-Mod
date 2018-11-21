#define ADDON DOUBLES(PREFIX,COMPONENT)

// Internal Functions
#define DOUBLES(var1,var2) ##var1##_##var2
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3
#define QUOTE(var1) #var1

#ifdef RECOMPILE
    #undef RECOMPILE
#endif
#define RECOMPILE recompile = 1


