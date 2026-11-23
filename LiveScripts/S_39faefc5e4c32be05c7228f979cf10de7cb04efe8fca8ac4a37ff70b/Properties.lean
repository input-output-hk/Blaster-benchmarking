import LiveScripts.Shared
import LiveScripts.S_39faefc5e4c32be05c7228f979cf10de7cb04efe8fca8ac4a37ff70b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_39faefc5e4c32be05c7228f979cf10de7cb04efe8fca8ac4a37ff70b.script [datum, redeemer, ctx] 10000]
