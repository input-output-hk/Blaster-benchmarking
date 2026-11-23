import LiveScripts.Shared
import LiveScripts.S_937ca0c270f10aefad00a0fe770febdfa6cda02cbc68a97a893500b5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_937ca0c270f10aefad00a0fe770febdfa6cda02cbc68a97a893500b5.script [ctx] 10000]
