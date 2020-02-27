import org.antlr.v4.runtime.misc.NotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EvalVisitor extends PascalBaseVisitor<Value> {
    private Map<String,Value> memory = new HashMap<String,Value>();

    
}