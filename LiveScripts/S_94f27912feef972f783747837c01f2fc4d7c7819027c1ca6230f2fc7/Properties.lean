import LiveScripts.Shared
import LiveScripts.S_94f27912feef972f783747837c01f2fc4d7c7819027c1ca6230f2fc7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_94f27912feef972f783747837c01f2fc4d7c7819027c1ca6230f2fc7.script [ctx] 10000]
