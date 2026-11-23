import LiveScripts.Shared
import LiveScripts.S_5abbaa2eb177b574707fa3617e3436295d45d7795e0874623a9504da.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5abbaa2eb177b574707fa3617e3436295d45d7795e0874623a9504da.script [ctx] 10000]
