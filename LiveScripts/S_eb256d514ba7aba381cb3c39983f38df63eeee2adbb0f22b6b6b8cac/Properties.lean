import LiveScripts.Shared
import LiveScripts.S_eb256d514ba7aba381cb3c39983f38df63eeee2adbb0f22b6b6b8cac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eb256d514ba7aba381cb3c39983f38df63eeee2adbb0f22b6b6b8cac.script [datum, redeemer, ctx] 10000]
