import LiveScripts.Shared
import LiveScripts.S_232c10966ce4d8e67c2eae17bb57c2cf4854a57509a752fbb3c02bd1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_232c10966ce4d8e67c2eae17bb57c2cf4854a57509a752fbb3c02bd1.script [datum, redeemer, ctx] 10000]
