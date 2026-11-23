import LiveScripts.Shared
import LiveScripts.S_48647c3e26b7444bc609e233e8b1f0867925aaa854d5d1688f2becb9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_48647c3e26b7444bc609e233e8b1f0867925aaa854d5d1688f2becb9.script [ctx] 10000]
