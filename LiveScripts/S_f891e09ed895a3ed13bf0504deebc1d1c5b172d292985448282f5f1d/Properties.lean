import LiveScripts.Shared
import LiveScripts.S_f891e09ed895a3ed13bf0504deebc1d1c5b172d292985448282f5f1d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f891e09ed895a3ed13bf0504deebc1d1c5b172d292985448282f5f1d.script [ctx] 10000]
