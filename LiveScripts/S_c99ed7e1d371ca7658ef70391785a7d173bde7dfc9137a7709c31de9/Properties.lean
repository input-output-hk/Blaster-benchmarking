import LiveScripts.Shared
import LiveScripts.S_c99ed7e1d371ca7658ef70391785a7d173bde7dfc9137a7709c31de9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c99ed7e1d371ca7658ef70391785a7d173bde7dfc9137a7709c31de9.script [ctx] 10000]
