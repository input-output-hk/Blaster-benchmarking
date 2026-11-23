import LiveScripts.Shared
import LiveScripts.S_c346130912e06576bf87dd42e6d27ca0e3a621110a8ef761b5715300.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c346130912e06576bf87dd42e6d27ca0e3a621110a8ef761b5715300.script [ctx] 10000]
