import LiveScripts.Shared
import LiveScripts.S_a64afc1e71d4676549c6a1687839da0247eef155fc4370009a1964fa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a64afc1e71d4676549c6a1687839da0247eef155fc4370009a1964fa.script [ctx] 10000]
