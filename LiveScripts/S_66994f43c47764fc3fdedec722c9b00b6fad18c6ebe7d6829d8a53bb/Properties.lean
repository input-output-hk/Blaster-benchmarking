import LiveScripts.Shared
import LiveScripts.S_66994f43c47764fc3fdedec722c9b00b6fad18c6ebe7d6829d8a53bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_66994f43c47764fc3fdedec722c9b00b6fad18c6ebe7d6829d8a53bb.script [datum, redeemer, ctx] 10000]
