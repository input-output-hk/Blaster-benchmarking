import LiveScripts.Shared
import LiveScripts.S_78f76aa28ae7081120b98e6675bfc18c2c930e4a574229b903958f06.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78f76aa28ae7081120b98e6675bfc18c2c930e4a574229b903958f06.script [ctx] 10000]
