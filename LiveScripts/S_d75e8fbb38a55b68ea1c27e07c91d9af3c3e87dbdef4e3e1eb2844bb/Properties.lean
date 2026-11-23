import LiveScripts.Shared
import LiveScripts.S_d75e8fbb38a55b68ea1c27e07c91d9af3c3e87dbdef4e3e1eb2844bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d75e8fbb38a55b68ea1c27e07c91d9af3c3e87dbdef4e3e1eb2844bb.script [ctx] 10000]
