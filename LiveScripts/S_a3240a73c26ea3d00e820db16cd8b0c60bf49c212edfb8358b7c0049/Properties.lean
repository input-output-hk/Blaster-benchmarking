import LiveScripts.Shared
import LiveScripts.S_a3240a73c26ea3d00e820db16cd8b0c60bf49c212edfb8358b7c0049.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a3240a73c26ea3d00e820db16cd8b0c60bf49c212edfb8358b7c0049.script [ctx] 10000]
