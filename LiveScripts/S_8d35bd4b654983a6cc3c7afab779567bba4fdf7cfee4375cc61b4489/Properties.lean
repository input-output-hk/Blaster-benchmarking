import LiveScripts.Shared
import LiveScripts.S_8d35bd4b654983a6cc3c7afab779567bba4fdf7cfee4375cc61b4489.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8d35bd4b654983a6cc3c7afab779567bba4fdf7cfee4375cc61b4489.script [ctx] 10000]
