import org.antlr.v4.runtime.misc.NotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EvalVisitor extends PascalBaseVisitor<Value> {
    private Map<String,Value> memory = new HashMap<String,Value>();


	/*********************************************************/


	@Override 
	public Value visitVarSingleDec(PascalParser.VarSingleDecContext ctx) { 
		//System.out.println("variable single declaration");
		String id = ctx.ID().getText();
		Value v = this.visit(ctx.expression());
		//System.out.println("Value stored: " + v.toString());

		switch (ctx.type.getType()) {
			case PascalParser.BOOLEAN:
				// System.out.println("Type: boolean");
				return memory.put(id, v);
			case PascalParser.REAL:
				// System.out.println("Type: real");
				return memory.put(id, v);
			default:
				throw new RuntimeException("unknown type: " + ctx.type.getType());
		}
	}


	@Override 
	public Value visitVarListDec(PascalParser.VarListDecContext ctx) {
		System.out.println("variable list declaration");
		return Value.VOID;
	}
	

	@Override
    public Value visitAssignStatement(PascalParser.AssignStatementContext ctx) {
		System.out.println("assign");
		String id = ctx.getText();
		Value v = this.visit(ctx.expression());
		System.out.println(id + " := " + v.toString());
		return memory.put(id, v);
	}
	

	@Override
    public Value visitExprExpression(PascalParser.ExprExpressionContext ctx) {
        return this.visit(ctx.expression());
    }


	@Override
    public Value visitSqrtExpression(PascalParser.SqrtExpressionContext ctx) {
		System.out.println("sqrt");
		Value v = this.visit(ctx.expression());
        return new Value(Math.sqrt(v.asDouble()));
	}


	@Override
    public Value visitSinExpression(PascalParser.SinExpressionContext ctx) { 
		System.out.println("sin");
		Value v = this.visit(ctx.expression());
        return new Value(Math.sin(v.asDouble()));
	}


	@Override 
	public Value visitCosExpression(PascalParser.CosExpressionContext ctx) {
		System.out.println("cos");
		Value v = this.visit(ctx.expression());
        return new Value(Math.cos(v.asDouble()));
	}


	@Override
    public Value visitLogExpression(PascalParser.LogExpressionContext ctx) {
		System.out.println("log");
		Value v = this.visit(ctx.expression());
        return new Value(Math.log(v.asDouble()));
	}


	@Override 
	public Value visitExpExpression(PascalParser.ExpExpressionContext ctx) { 
		System.out.println("exp");
        Value v = this.visit(ctx.expression());
        return new Value(Math.exp(v.asDouble()));
	}


	@Override
   	public Value visitMultiplicativeExpression(PascalParser.MultiplicativeExpressionContext ctx) {
		Value left = this.visit(ctx.expression(0));
        Value right = this.visit(ctx.expression(1));

        switch (ctx.op.getType()) {
            case PascalParser.PRODUCT:
                return new Value(left.asDouble() * right.asDouble());
            case PascalParser.DIVIDE:
                return new Value(left.asDouble() / right.asDouble());
            case PascalParser.MOD:
                return new Value(left.asDouble() % right.asDouble());
            default:
                throw new RuntimeException("unknown operator: " + PascalParser.tokenNames[ctx.op.getType()]);
        }
	}


	@Override 
	public Value visitAdditiveExpression(PascalParser.AdditiveExpressionContext ctx) { 
		Value left = this.visit(ctx.expression(0));
        Value right = this.visit(ctx.expression(1));

        switch (ctx.op.getType()) {
            case PascalParser.PLUS:
                return left.isDouble() && right.isDouble() ?
                        new Value(left.asDouble() + right.asDouble()) :
                        new Value(left.asString() + right.asString());
            case PascalParser.MINUS:
                return new Value(left.asDouble() - right.asDouble());
            default:
                throw new RuntimeException("unknown operator: " + PascalParser.tokenNames[ctx.op.getType()]);
        }
	}


	@Override 
	public Value visitNegExpression(PascalParser.NegExpressionContext ctx) { 
		System.out.println("unary minus");
		Value v = this.visit(ctx.expression());
        return new Value(-v.asDouble());
	}


	@Override 
	public Value visitAndExpression(PascalParser.AndExpressionContext ctx) { 
		System.out.println("and");
		Value left = this.visit(ctx.expression(0));
        Value right = this.visit(ctx.expression(1));
        return new Value(left.asBoolean() && right.asBoolean());
	}


	@Override 
	public Value visitOrExpression(PascalParser.OrExpressionContext ctx) {
		System.out.println("or");
		Value left = this.visit(ctx.expression(0));
        Value right = this.visit(ctx.expression(1));
        return new Value(left.asBoolean() || right.asBoolean());
	}


	// @Override 
	// public Value visitRelationalExpression(PascalParser.RelationalExpressionContext ctx) {
	// 	System.out.println("relational");
	// 	Value left = this.visit(ctx.expression(0));
    //     Value right = this.visit(ctx.expression(1));
		
    //     switch (ctx.op.getType()) {
	// 		case PascalParser.GT:
	// 			if (left != null && right != null) {
	// 				System.out.println(left.asDouble());
	// 				return new Value(left.asDouble() > right.asDouble());
	// 			}
	// 		case PascalParser.LT:
	// 			if (left != null && right != null)  {
	// 				System.out.println(left.asDouble());
	// 				return new Value(left.asDouble() < right.asDouble());
	// 			}
	// 		case PascalParser.GE:
	// 			if (left != null && right != null)  {
	// 				System.out.println(left.asDouble());
	// 				return new Value(left.asDouble() >= right.asDouble());
	// 			}
	// 		case PascalParser.LE:
	// 			if (left != null && right != null)  {
	// 				System.out.println(left.asDouble());
	// 				return new Value(left.asDouble() <= right.asDouble());
	// 			}
    //         default:
	// 			throw new RuntimeException("unknown operator: " + PascalParser.tokenNames[ctx.op.getType()]);
    //     }
	// 	return this.visit(ctx.expression(0));
	// }


	// @Override 
	// public Value visitPrintInside(PascalParser.PrintInsideContext ctx) { 
	// 	//Value value = this.visit(ctx.expression(0));
	// 	System.out.println("write");
	// 	return Value.VOID;
	// }


	// @Override 
	// public Value visitPrintNewline(PascalParser.PrintNewlineContext ctx) {
	// 	System.out.println("writeln");
	// 	return Value.VOID;
	// }


	// @Override 
	// public Value visitCaseStatement(PascalParser.CaseStatementContext ctx) {
	// 	Value value = this.visit(ctx.expression());
	// 	System.out.println("while");
	// 	System.out.println(value.asBoolean());

	// 	if (value!=null) {
	// 		while(value.asBoolean()) {
	// 			// evaluate code block
	// 			value = this.visit(ctx.expression());
	// 			// evaluate expression
	// 			this.visit(ctx.statements());
	// 		}
	// 	}
	// }


	// @Override 
	// public Value visitEqualityExpression(PascalParser.EqualityExpressionContext ctx) { 
	// 	System.out.println("equality");
	// 	return this.visit(ctx.expression(0));
	// }


	// @Override 
	// public Value visitWhileDoLoop(PascalParser.WhileDoLoopContext ctx) { 
	// 	Value value = this.visit(ctx.expression());
	// 	//System.out.println("while");
	// 	//System.out.println(value.asBoolean());
	// 	if (value != null){
	// 		while(value.asBoolean()) {
	// 			// evaluate code block
	// 			this.visit(ctx.statements());
	// 			// evaluate expression
	// 			value = this.visit(ctx.expression());
	// 		}
	// 	}
    //     return Value.VOID;
	// }


	// @Override 
	// public Value visitIfStatement(PascalParser.IfStatementContext ctx) {
	// 	System.out.println("if");
	// 	Value value = this.visit(ctx.expression());
	// 	//System.out.println(value.asBoolean());

	// 	if (value != null) {
	// 		while(value.asBoolean()) {
	// 			// evaluate code block
	// 			this.visit(ctx.statement());
	// 			// evaluate expression
	// 			value = this.visit(ctx.expression());
	// 		}
	// 	}
    //    return Value.VOID;
	// }


	// @Override 
	// public Value visitForDoLoop(PascalParser.ForDoLoopContext ctx) { 
	// 	System.out.println("for loop");
	// 	return this.visit(ctx.expression(0));
	// }


	@Override 
	public Value visitNumberAtom(PascalParser.NumberAtomContext ctx) { 
		//System.out.println("number atom");
		return new Value(Double.valueOf(ctx.getText()));
	}


	@Override 
	public Value visitBooleanAtom(PascalParser.BooleanAtomContext ctx) { 
		//System.out.println("boolean atom");
		return new Value(Boolean.valueOf(ctx.getText()));
	}


    @Override 
    public Value visitIdAtom(PascalParser.IdAtomContext ctx) {
		//System.out.println("id atom");
		String id = ctx.getText();
		Value v = memory.get(id);
		
        if (v == null) {
            throw new RuntimeException("no such variable: " + id);
        }
        return v;
	}


    @Override 
    public Value visitStringAtom(PascalParser.StringAtomContext ctx) {
		//System.out.println("string atom");
		String str = ctx.getText();
        // strip quotes
        str = str.substring(1, str.length() - 1).replace("\"\"", "\"");
        return new Value(str);
	}
}
